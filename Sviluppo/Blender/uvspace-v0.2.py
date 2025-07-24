import bpy
import bmesh
import gpu
from gpu_extras.batch import batch_for_shader
from mathutils import Matrix, Vector
import numpy as np
from math import sqrt

'''
Calculate UV coverage for mesh - script v0.2
--------------------------------------------
UV areas outside 0.0-1.0 will be ignored.

Method: draw the UV faces in a temporary image (an offscreen gpu buffer),
similar to the image you see in the UV editor,
and count the number of drawn pixels to get the UV coverage.

This way overlapping UV will not result in a coverage > 100%.
'''

# Size of offscreen rendered UV image
UV_IMG_SIZE = 512

# Force object mode, to ensure uv map is up to date
obj_mode = bpy.context.active_object.mode
if obj_mode != 'OBJECT':
    bpy.ops.object.mode_set(mode='OBJECT')

# Get active object as bmesh
bm = bmesh.new()
bm.from_mesh(bpy.context.active_object.data)

# Get active uv map
uv_layer = bm.loops.layers.uv.active

# Init offscreen gpu image of UV map
# See: https://docs.blender.org/api/current/gpu.html#copy-offscreen-rendering-result-back-to-ram
# and: https://docs.blender.org/api/current/gpu.html#d-rectangle
offscreen = gpu.types.GPUOffScreen(UV_IMG_SIZE, UV_IMG_SIZE)
shader = gpu.shader.from_builtin('2D_UNIFORM_COLOR')
shader.bind()
shader.uniform_float('color', (0.5, 0.5, 0.5, 1.0))

# Draw uv image in offscreen gpu buffer
with offscreen.bind():
    fb = gpu.state.active_framebuffer_get()
    fb.clear(color=(0.0, 0.0, 0.0, 0.0))
    with gpu.matrix.push_pop():
        # Set gpu draw matrix to [-1.0, 1.0]
        gpu.matrix.load_matrix(Matrix.Identity(4))
        gpu.matrix.load_projection_matrix(Matrix.Identity(4))
        vec_one = Vector((1, 1))

        # Iterate mesh faces
        for face in bm.faces:
            # Get uv vertices
            uv_verts = []
            for loop in face.loops:
                # Convert vector from [0.0, 1.0] to [-1.0, 1.0]
                uv_verts.append((loop[uv_layer].uv) * 2 - vec_one)
            
            # Draw uv triangles in offscreen image
            if len(uv_verts) >= 3:
                # First triangle
                vertices = (uv_verts[0], uv_verts[1], uv_verts[2])
                batch = batch_for_shader(shader, 'TRIS', {'pos': vertices})
                batch.draw(shader)
            if len(uv_verts) == 4:
                # Second triangle
                vertices = (uv_verts[0], uv_verts[2], uv_verts[3])
                batch = batch_for_shader(shader, 'TRIS', {'pos': vertices})
                batch.draw(shader)
            
            # Only triangles and quads are supported
            if len(uv_verts) > 4:
                print('N-gons in UV map not supported!')
                break
    
    # Get RGBA color data from offscreen buffer
    buffer = fb.read_color(0, 0, UV_IMG_SIZE, UV_IMG_SIZE, 4, 0, 'FLOAT')
    buffer.dimensions = UV_IMG_SIZE * UV_IMG_SIZE * 4

# Release offscreen render
offscreen.free()

# DEBUG: create image in Blender to inspect the result
if False:
    IMAGE_NAME = 'UV Coverage'
    if IMAGE_NAME not in bpy.data.images:
        bpy.data.images.new(IMAGE_NAME, UV_IMG_SIZE, UV_IMG_SIZE)
    image = bpy.data.images[IMAGE_NAME]
    image.scale(UV_IMG_SIZE, UV_IMG_SIZE)
    image.pixels.foreach_set(buffer)

# From RGBA color data, get the alpha channel (in numpy array)
buffer_np = np.array(buffer).reshape((UV_IMG_SIZE, UV_IMG_SIZE, 4))[:, :, 3]

# Calculate uv coverage:
# filled area (alpha is not zero) divided by total image size
uv_coverage = buffer_np[buffer_np != 0].shape[0] / (UV_IMG_SIZE * UV_IMG_SIZE)

# Print uv coverage
print('UV coverage:', uv_coverage)

# Return to original mode
if obj_mode != 'OBJECT':
    bpy.ops.object.mode_set(mode=obj_mode)

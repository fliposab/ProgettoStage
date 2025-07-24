import bpy
import bmesh
import mathutils

'''
Assumptions for script v0.1
---------------------------
1. UV map doesn't have overlapping faces
2. All UV coordinates are between 0.0 and 1.0
'''

# Force object mode, to ensure uv map is up to date
obj_mode = bpy.context.active_object.mode
if obj_mode != 'OBJECT':
    bpy.ops.object.mode_set(mode='OBJECT')

# Get active object as bmesh
bm = bmesh.new()
bm.from_mesh(bpy.context.active_object.data)

# Get active uv map
uv_layer = bm.loops.layers.uv.active

# Init uv area
uv_area = 0

# Iterate mesh faces
for face in bm.faces:
    # Get uv vertices
    uv_verts = []
    for loop in face.loops:
        uv_verts.append(loop[uv_layer].uv)
    
    # Calculate area between uv vertices
    if len(uv_verts) >= 3:
        # First triangle of quad
        uv_area += mathutils.geometry.area_tri(uv_verts[0], uv_verts[1], uv_verts[2])
    if len(uv_verts) == 4:
        # Second triangle of quad
        uv_area += mathutils.geometry.area_tri(uv_verts[0], uv_verts[2], uv_verts[3])
    
    # I suppose this can never happen...
    if len(uv_verts) > 4:
        print('N-gons in UV map not supported!')
        break

# Print uv coverage, equal to the calculated uv area sum,
# since we assume no overlaps and uv coords between 0.0 and 1.0.
print('UV coverage:', uv_area)

# Return to original mode
if obj_mode != 'OBJECT':
    bpy.ops.object.mode_set(mode=obj_mode)
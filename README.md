# Blender Python module

Create `yourscript.py` as usual:

    #!/usr/bin/python3
    import bpy
    ....

Run it in the blender environment:

    docker run --rm -v $(pwd):/data amlinux/blender-python:latest ./yourscript.py


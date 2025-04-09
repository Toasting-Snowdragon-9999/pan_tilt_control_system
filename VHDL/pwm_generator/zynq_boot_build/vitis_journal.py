# IPython log file

# Set your workspace
workspace = create_workspace(path="fsbl_ws", name="fsbl_workspace")

# Create platform from your .xsa
platform = workspace.create_platform_component(name="my_platform", hw="design.xsa")

# Create the FSBL app project
fsbl = workspace.create_app_component(name="fsbl", platform=platform, template="Zynq FSBL")

# Build it
fsbl.build()
from vitis.workspace import open_workspace

# Step 1: Open or create workspace
ws = open_workspace("fsbl_ws")

# Step 2: Create platform from XSA
platform = ws.create_platform_component(name="my_platform", hw="design.xsa")

# Step 3: Create FSBL application
fsbl = ws.create_app_component(name="fsbl", platform=platform, template="Zynq FSBL")

# Step 4: Build the FSBL
fsbl.build()

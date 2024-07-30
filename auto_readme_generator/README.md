# auto_readme_generator
This tool helps you generate a standardized README.md for your ROS 2 packages, ensuring consistency and saving time.
Refer to [a sample generated README.md](sample_README.md) for an example.

## What is this contribution?
- Provides a README.md template for ROS 2 packages.
- Ensures a "unified feeling" across your packages' README.md files.
- Saves time by reducing the effort needed to write README.md files.
- Prevents discrepancies between the README.md and the descriptions of ROS topics, parameters, services, etc.


## Usage
```
# Run your ROS 2 node
bash generate_readme.bash package_name /node_name > ~/path/to/package_name/README.md

# Then modify it as needed
```
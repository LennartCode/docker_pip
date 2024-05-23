# Pip and Docker Not Working Together
I want to build a Docker container that includes a Flask project. The project uses a `pyproject.toml` file to specify the dependencies.

When I try to build the container, the build step (specifically the line `RUN python -m pip install .`) takes very long. I have aborted the process after one hour.

Apparently, building the local project is the problem here, as if I install the same packages using a `requirements.txt` file though, the build process takes about 10 seconds (see `Dockerfile` for comparison).

Expected behavior
Building from a `pyproject.toml` should not take much longer than building from a `requirements.txt`. Building the project in addition to the dependencies does however.



## Reproduction

1. Install Docker
2. Clone the repository
3. At the repository root, run `docker build .` (will not terminate)
4. Modify the `Dockerfile` to build the dependencies not from the `pyproject.toml` but the `requirements.txt`
5. At the repository root, run `docker build .` (will successfully build in seconds)

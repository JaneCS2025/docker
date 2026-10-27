FROM python:3.12-slim  
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

# Uses a lightweight Linux image with Python 3.12 as the base environment
#	Sets the working directory inside the container to /app, creating it if necessary. Subsequent commands run from this directory by default.
#	Copies requirements.txt from the local build context into the container’s current directory: /app/requirements.txt.
# Installs Python dependencies during the image build. --no-cache-dir prevents pip from storing download caches, reducing image size.
#	Copies files from the build context into /app inside the container, excluding files specified in .dockerignore.
# Documents that the application uses port 8000 inside the container. It does not automatically publish the port to your computer.

# Swapping the order (put COPY . . before pip install) and rebuild: every code change reinstalls everything

#Why do we copy requirements.txt before the rest of the code?
#To use Docker's layer cache. Each instruction creates a layer, and Docker rebuilds a layer only if it or something before it changed. Dependencies change rarely while code changes constantly. Copying requirements.txt and installing dependencies first means a code change rebuilds only the final COPY layer, so builds take seconds instead of minutes.

#4. How do you keep a database's data when the container is deleted?
#Use a volume. A container's writable layer is deleted along with the container, so data stored only there is lost. A volume is storage managed by Docker that lives outside the container's lifecycle. You mount it at the database's data directory, for example -v pgdata:/var/lib/postgresql/data for Postgres, and the data survives when the container is deleted and recreated. A bind mount to a host folder also works.

# Runs on Alpine container, latest version.
FROM alpine
# Copy the content to the container.
COPY . /
# Grant executable permission on the script.
RUN ["chmod", "+x", "/entrypoint.sh"]
# Runs the script.
ENTRYPOINT [ "/entrypoint.sh" ]
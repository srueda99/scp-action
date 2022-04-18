# Runs on Alpine container, latest version.
FROM alpine
# Copy the script to the home directory of the container.
COPY entrypoint.sh /home/entrypoint.sh
# Grant executable permission on the script.
RUN ["chmod", "+x", "/home/entrypoint.sh"]
# Runs the script.
ENTRYPOINT [ "/entrypoint.sh" ]
# Use the official n8n image
FROM n8nio/n8n:latest

# Switch to root so we can install packages
USER root

# Install community nodes globally into the container
RUN npm install -g n8n-nodes-pdfco

# Create directory for n8n custom nodes
RUN mkdir -p /home/node/.n8n/nodes

# Symlink global install to n8n's local nodes dir
RUN ln -s /usr/local/lib/node_modules/n8n-nodes-pdfco /home/node/.n8n/nodes/n8n-nodes-pdfco

# Fix permissions so n8n can run
RUN chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Start n8n
CMD [ "n8n" ]

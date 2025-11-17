FROM n8nio/n8n:latest

USER root

# Create custom directory for community nodes
RUN mkdir -p /home/node/custom && chown -R node:node /home/node/custom

USER node

# Install PDFco node into custom directory WITHOUT running its postinstall script
RUN cd /home/node/custom && npm install --ignore-scripts n8n-nodes-pdfco

# Tell n8n to load nodes from the custom folder
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
ENV NODE_PATH=/home/node/custom/node_modules

# Start n8n normally
CMD ["n8n"]


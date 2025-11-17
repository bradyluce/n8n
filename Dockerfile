FROM n8nio/n8n:latest

USER root

# Install the PDFco community node WITHOUT running its postinstall scripts
RUN npm install -g --ignore-scripts n8n-nodes-pdfco

# Create the n8n community nodes directory
RUN mkdir -p /home/node/.n8n/nodes

# Symlink the installed PDFco node to n8n's node directory
RUN ln -s /usr/local/lib/node_modules/n8n-nodes-pdfco /home/node/.n8n/nodes/n8n-nodes-pdfco

# Fix permissions so n8n can read/write
RUN chown -R node:node /home/node/.n8n

USER node

CMD [ "n8n" ]

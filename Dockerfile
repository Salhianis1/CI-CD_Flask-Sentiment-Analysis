# Use the official Python image based on Debian
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Install NLTK and download required resources
RUN python -m nltk.downloader vader_lexicon punkt stopwords wordnet 

# Optional: Set Flask environment variable
ENV FLASK_APP=main.py

# Expose the port Flask is running on
EXPOSE 5000

# Run the Flask application
CMD ["python", "main.py"]

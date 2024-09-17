# Dockerfile
FROM rocker/r-ver:4.1.0

# Instala pacotes necessários
RUN apt-get update && \
    apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev

# Define um espelho do CRAN
RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"))' >> /usr/local/lib/R/etc/Rprofile.site

# Instala pacotes R necessários
RUN R -e "install.packages(c('jsonlite', 'httr'))"

# Copia os arquivos da aplicação para o contêiner
COPY app.R /var/task/app.R
COPY bootstrap /var/task/bootstrap

# Define permissões de execução para o script de entrada
RUN chmod +x /var/task/bootstrap

# Define o ponto de entrada do contêiner
ENTRYPOINT ["/var/task/bootstrap"]

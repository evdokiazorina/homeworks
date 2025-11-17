FROM r-base:latest
WORKDIR /home
RUN mkdir -p /home/results
RUN mkdir -p /home/scripts
RUN R -e "install.packages('ggplot2', repos='https://cloud.r-project.org/')"
COPY analysis_script.R /home/scripts/analysis_script.R
CMD ["Rscript", "/home/scripts/analysis_script.R"]
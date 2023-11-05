FROM rhub/r-minimal:4.3.2
RUN apk update
RUN apk add --no-cache --update-cache \
    --repository http://nl.alpinelinux.org/alpine/v3.11/main \
    autoconf=2.69-r2 \
    automake=1.16.1-r0 \
    bash tzdata g++
RUN echo "America/New_York" > /etc/timezone
RUN installr -d \
    -t "R-dev file linux-headers harfbuzz-dev fribidi-dev freetype-dev libpng-dev tiff-dev jpeg-dev \
                   libxml2-dev gnutls-dev openssl-dev libx11-dev cairo-dev libxt-dev" \
    -a "libxml2 cairo libx11 font-xfree86-type1" \
    tidyquant knitr rmarkdown
RUN Rscript -e "install.packages('stringi',type='source',repos='http://cran.us.r-project.org')"
RUN rm -rf /var/cache/apk/*

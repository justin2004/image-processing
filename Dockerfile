FROM justin2004/common-lisp-jupyter

USER root
RUN pacman -Sy --noconfirm imagemagick

USER app

RUN mkdir /home/app/common-lisp-jupyter/image-filtering/
ADD src/ /home/app/common-lisp-jupyter/image-filtering/

USER root
RUN chmod 777 /home/app/common-lisp-jupyter/image-filtering/images
USER app

# get latest version of april
RUN mkdir -p /home/app/.roswell/lisp/quicklisp/local-projects
WORKDIR  /home/app/.roswell/lisp/quicklisp/local-projects
RUN git clone https://github.com/phantomics/april.git


WORKDIR   /home/app/common-lisp-jupyter/image-filtering


FROM justin2004/common-lisp-jupyter

USER root
RUN pacman -Sy --noconfirm imagemagick

USER app

RUN mkdir /home/app/common-lisp-jupyter/image-filtering/
ADD src/ /home/app/common-lisp-jupyter/image-filtering/

USER root
RUN chmod 777 /home/app/common-lisp-jupyter/image-filtering/images
USER app

WORKDIR   /home/app/common-lisp-jupyter/image-filtering


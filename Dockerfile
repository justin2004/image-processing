FROM yitzchak/common-lisp-jupyter

USER root
RUN pacman -Sy --noconfirm imagemagick

USER app

RUN mkdir /home/app/common-lisp-jupyter/image-filtering/
ADD src/ /home/app/common-lisp-jupyter/image-filtering/

WORKDIR   /home/app/common-lisp-jupyter/image-filtering


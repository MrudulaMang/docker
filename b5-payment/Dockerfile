#session 59 :  33:30 hardend image -> no previlage acces keep only what u need
FROM python:3.9.25-alpine3.22 AS builder
    # Pulls the official Python 3.9.25 image based on Alpine Linux 3.22. Named builder so Stage 2 can reference it. Alpine is ~5MB vs ~900MB for Debian-based images.
WORKDIR /app
    # Sets /app as the working directory. All subsequent commands run from here. Creates it if it doesn't exist.
RUN apk add --no-cache build-base linux-headers pcre-dev 
    # check at the end for full reference
    #alpine dont have many dependencies so we are including them here, so that it dont fail
COPY requirements.txt .
RUN pip3.9 install --prefix=/install -r requirements.txt  
 # python dependencies will be installed in install folder which will be created
 # This isolated directory will be selectively copied to Stage 2, leaving build tools behind.


FROM python:3.9.25-alpine3.22
EXPOSE 8080
WORKDIR /app
RUN apk add --no-cache pcre
#   adding install dir to /usr/local, anything here are executable
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
#    Creates a system group and user (-S = system, no password, no home dir). Running as non-root is a security best practice — limits blast radius if the app is compromised.
RUN chown -R roboshop:roboshop /app
COPY --from=builder /install /usr/local 
# can use COPY --chown=roboshop:roboshop payment.ini *.py requirement.txt -> WITH USERNAME (39:32)
COPY payment.ini *.py requirements.txt .
# ENV CART_HOST="cart" \
#     CART_PORT="8080" \
#     USER_HOST="user" \
#     USER_PORT="8080" \
#     AMQP_HOST="rabbitmq" \
#     AMQP_USER="roboshop" \
#     AMQP_PASS="roboshop123" 
USER roboshop                   
CMD ["uwsgi", "--ini", "payment.ini"]





#docker exec -it rabbitmq rabbitmqctl list_users

# rabbitmqctl add_user roboshop roboshop123
# rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"

# FROM pyhton:3.9 #this might be on debian/unbuntu size is large
# EXPOSE 8080
# WORKAPP /app
# COPY payment.ini
# COPY *.py 
# COPY requirements.txt
# RUN pip install -r requirements.txt # install app dependencies
# CMD ["uwsgi", "--ini", "payment.ini"] 

# ------------------
# RUN apk add --no-cache build-base linux-headers pcre-dev
    # Installs compile-time dependencies via Alpine's package manager:
    # PackagePurposebuild-baseGCC, make, libc-dev — needed to compile C extensionslinux-headersKernel headers required by some Python packagespcre-devPCRE regex dev headers — needed to compile uWSGI
    # --no-cache skips writing the package index to disk, keeping the image smaller.
# COPY requirements.txt .
    # Copies only requirements.txt first (before source code).
    # This is a Docker layer caching trick — if your code changes but dependencies don't, Docker reuses the cached pip install layer.
#------------
#     but base is same in both stages right

# Yes, exactly! Base is the same — python:3.9.25-alpine3.22 (~50MB).

# The difference is what you layer on top of that base:

# Base (~50MB)          Base (~50MB)
#     +                     +
# build-base            pcre only
# linux-headers             +
# pcre-dev              your app files
#     +                     +
# pip cache             /install copy
#     +                     =
# compiled deps         ~80MB final ✅
#     =
# ~300MB (thrown away) ❌

# So the base being the same doesn't matter — Docker treats each FROM as a completely independent image. Stage 1's extra layers never bleed into Stage 2.
# The only thing that crosses the boundary is what you explicitly copy:
# dockerfile

# COPY --from=builder /install /usr/local  # ← this is the only bridge
# Everything else in Stage 1 — GCC, build headers, pip cache — just gets discarded. Docker never includes it in the final image.    

# COPY --from=builder /install /usr/local
# Copies the compiled dependencies from Stage 1's /install into /usr/local of the final image. Since /usr/local/lib, /usr/local/bin etc. are on Python's and the shell's default paths, everything is immediately importable and executable — no PYTHONPATH needed.

# CMD ["uwsgi", "--ini", "payment.ini"]
# The default command when the container starts. Runs uWSGI (Python WSGI server) using payment.ini for configuration (workers, socket, app module, etc.). Uses exec form (JSON array) — avoids wrapping in a shell, so signals like SIGTERM reach uWSGI directly for graceful shutdown.

export CQC_PORT=81
export CQC_HOST=167.99.104.60
# which is 'the server'
#A: does the hard work but is not named server

# server serves/controls app
export CQC_SERVERROOT="/root/cqc-server"  
export CQC_APPROOT="/root/mail-endpoint"  # app

#that looks pretty good, APP/SERVER
# BUT we use CQC_SERVERROOT all the time elsewhere

NODERUNTIME=$(which node)

#B: simple wrapper
./daemonize -c $CQC_SERVERROOT \
            -p $CQC_SERVERROOT/pid \
            -u root \
            -o $CQC_SERVERROOT/stdout \
            -e $CQC_SERVERROOT/stderr \
            -v \
$NODERUNTIME --experimental-modules ./cqc-server.mjs

# I favor #B as it would be a signal handler
# more than anything else. In my mind, server
# is providing a place to plug in.


# Notes for Ben re: daemonize

# okay. two choices. nohup or daemonize.

# Pros of nohup
# - builtin
# - simple
# Cons
# - feels incomplete
# - blocking instead of loading daemon proper

# Daemonize
# -soruce code
# - excellent c program
# - total transparency
# Daemonize Cons
# - cant install via apt-get
# - must build or we can copy a pre-built
#
# Copying prebuilt daemonize program Pros
# - easy
# Copying prebuilt daemonize program Cons
# - we have to build beforehand (not a big deal)
# - where we deploy needs to be sam arch as where
#   we build (since we are creating machine code)
#   nota big deal. Alternatively, we could 
#   git clone daemonize and build on cqc-primary

#  Questions?

#parsing
# I have some prejudice for daemonize simply because I've seen it used
# I also know it's more of a production to get it started.
# I lean towards daemonize and I wonder about how best to install it on
# a droplet. I  I've got ideas I can show about this
#
# daemonize it is..

# 

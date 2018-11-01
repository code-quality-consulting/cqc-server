# this way is very different than the daemonize. And we 
# may want to just use this way. In some ways storing 
# a file can be brittle.
# Its time to keep a loose grip on both methods.
# we can still get the objctive accomplished..

CQC_PID=$(ps -ef | grep node | grep -v grep | awk '{print $2}')
kill -15 $CQC_PID

# the reason I stopped here was to point out that to 'kill'
# a process, one must send a signal to it. -15 above.

# lets take a look at the signals we can send..

## I believe we might want to create and export CQC_PID earlier because
## we have to use the pid with daemonize, correct?
# go question.. allow me for sec..


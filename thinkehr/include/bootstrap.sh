#!/bin/bash

set -e
set -u

# Supervisord default params
SUPERVISOR_PARAMS='-c /etc/supervisord.conf'

echo "INFO: THINKEHR_INIT_DB = $THINKEHR_INIT_DB"

echo "INFO: bootstrap is sleeping for 10 seconds"
sleep 10

# if [ ! -f /opt/thinkehr/status/db-init-complete ]; then
#   cd /opt/thinkehr; ./bin/initdb.sh; touch /opt/thinkehr/status/db-init-complete;
# fi

if [[ "${THINKEHR_INIT_DB}" == "true" ]]; then
  cd /opt/thinkehr; ./bin/initdb.sh; echo "INFO: bootstrap is sleeping for 5 seconds"; sleep 5
fi

# We have TTY, so probably an interactive container...
if test -t 0; then
  # Run supervisord detached...
  supervisord $SUPERVISOR_PARAMS

  # Some command(s) has been passed to container? Execute them and exit.
  # No commands provided? Run bash.
  if [[ $@ ]]; then
    eval $@
  else
    export PS1='[\u@\h : \w]\$ '
    /bin/bash
  fi

# Detached mode? Run supervisord in foreground, which will stay until container is stopped.
else
  # If some extra params were passed, execute them before.
  # @TODO It is a bit confusing that the passed command runs *before* supervisord,
  #       while in interactive mode they run *after* supervisor.
  #       Not sure about that, but maybe when any command is passed to container,
  #       it should be executed *always* after supervisord? And when the command ends,
  #       container exits as well.
  if [[ $@ ]]; then
    eval $@
  fi
  supervisord -n $SUPERVISOR_PARAMS
fi

export NEWPATH=/home/gkpc/Works/N32926/EASYHMI
export OLDPATH=/home/openpc/SWIKOON/SWK.EASYHMI/N32926.frame
export DESTDIR=easyhmi-n32926-qt-everywhere-opensource-src-5.5.0
grep "${OLDPATH}" ./${DESTDIR} -rl | xargs sed -i 's#'$OLDPATH'#'$NEWPATH'#g'

#!/bin/bash
set -euo pipefail

TAR="boost_1_75_0.tar.gz"
MD5="38813f6feb40387dfe90160debd71251"
DIR="boost_1_75_0"

if [[ ! -f "$TAR" ]]; then
  echo "Downloading Boost sources..."
  wget -q --show-progress https://dl.bintray.com/boostorg/release/1.75.0/source/boost_1_75_0.tar.gz
fi

if [[ "$MD5" != "$(md5 -q $TAR)" ]]; then
  echo "TAR checksum is incorrect! Try to run cleanup"
  exit 1
fi

if [[ ! -d "$DIR" ]]; then
  echo "Extracting sources from the archive..."
  tar -xf "$TAR"

  echo "Building B2 engine..."
  cd "$DIR"
  ./bootstrap.sh 1>/dev/null
  cd -
fi

echo "Creating 'bench.sh' script"
if [[ -f bench.sh ]]; then
  rm bench.sh
fi

echo "#!/bin/bash
set -eu

cleanup() {
  rm -rf bin.v2
}

trap cleanup EXIT

cd $DIR
echo 'Boost-build benchmark is started...'
time ./b2 1>/dev/null
cd -
" >bench.sh
chmod u+x bench.sh

echo "Done!"

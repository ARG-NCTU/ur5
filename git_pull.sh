#! /bin/bash

current_path=$(pwd)
BRANCH=master
if [ ! -z "$1" ]; then
    echo "pull branch: $1"
    BRANCH=$1
fi

echo "-----------------------------------------------------------------------"
echo "-------------------------pull ur5 -------------------------------------"
echo "-----------------------------------------------------------------------"
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in mm-dual-arm-regrasp. Aborting"
   return 1
fi

BRANCH=kinetic-devel

echo "-----------------------------------------------------------------------"
echo "-------------------------pull robotiq -------------------------------"
echo "-----------------------------------------------------------------------"
cd $current_path/robotiq
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in robotiq. Aborting"
   return 1
fi

BRANCH=melodic-devel

echo "-----------------------------------------------------------------------"
echo "-------------------------pull universal_robot -------------------------"
echo "-----------------------------------------------------------------------"
cd $current_path/universal_robot
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in universal_robot. Aborting"
   return 1
fi

BRANCH=master

echo "-----------------------------------------------------------------------"
echo "-------------------------pull ur_modern_driver -------------------------"
echo "-----------------------------------------------------------------------"
cd $current_path/ur_modern_driver
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in ur_modern_driver. Aborting"
   return 1
fi


BRANCH=master

echo "-----------------------------------------------------------------------"
echo "-------------------------pull arm_operation ---------------------------"
echo "-----------------------------------------------------------------------"
cd $current_path/arm_operation
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in arm_operation. Aborting"
   return 1
fi

cd $current_path
return 0

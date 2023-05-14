
gr()
{
   find -name .git -exec sh -c "cd \"\$(dirname \"{}\")\"; printf \"|----- \"; pwd; $*;" \;
}

grg()
{
   find -type d -name .git -exec sh -c "cd \"\$(dirname \"{}\")\"; printf \"|----- \"; pwd; $*;" \;
}

grs()
{
   find -type f -name .git -exec sh -c "cd \"\$(dirname \"{}\")\"; printf \"|----- \"; pwd; $*;" \;
}

function dot {
   git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@
}

gsls()
{
   find -type d -name .git -exec sh -c "cd \"\$(dirname \"{}\")\"; printf \"|----- \"; pwd; git status -s -b --ahead-behind" \;
}

gfls()
{
   find -type d -name .git -exec sh -c "cd \"\$(dirname \"{}\")\"; printf \"|----- \"; pwd; git fetch; git status -s -b --ahead-behind" \;
}

gat()
{
   find -type d -name .git -exec sh -c "cd \"\$(dirname \"{}\")\"; printf \"|----- \"; pwd; git tag $1; git push origin $1" \;
}

gatm()
{
   find -type d -name .git -exec sh -c "cd \"\$(dirname \"{}\")\"; printf \"|----- \"; pwd; git tag -a -m \"$2\" $1; git push origin $1" \;
}

cpMods()
{
   mkdir -p ../mods
   cp --parents $(git ls-files --modified --others --exclude-standard) ../mods
}

cpOnlyMods()
{
   mkdir -p ../onlymods
   cp --parents $(git ls-files --modified) ../onlymods
}

findDiff()
{
   fileToDiffPath=$1
   fileToDiff=$(basename "$fileToDiffPath")

   echo "$fileToDiff"

   find -type f -name "$fileToDiff" -exec vimdiff "$fileToDiffPath" "{}" \;
}

brightness()
{
   max_brightness=$(cat "/sys/class/backlight/intel_backlight/max_brightness")
   scale=$(expr $max_brightness \* $1)
   set_brightness=$(expr $scale / 100)
   echo $set_brightness > "/sys/class/backlight/intel_backlight/brightness"
}

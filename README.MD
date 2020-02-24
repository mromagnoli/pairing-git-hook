#Script to use as Git hook

## Motivation
While doing pairing, I believe that it is important to reflect that you were working with someone else and give credit to that person.
This script is intended to help with this issue by adding the Github convention text **Co-authored-by: ...** just below your commit message.

##Usage

Copy the **pairing.sh** file to your *.git/hooks/* dir or link this file to that directory. It should be named *pre-commit-msg*

```
cp pairing.sh .git/hooks/prepare-commit-msg

# or

ln pairing.sh .git/hooks/prepare-commit-msg
```
Don't forget to make it executable

```
chmod +x .git/hooks/prepare-commit-msg
```

Then just add a *.pairs* file in your repository's root directory following this format:

```
alias,Name LastName,email
<new line>

# Example
chelo, Marcelo Romagnoli, marce.romagnoli@gmail.com

```

Then when you try to commit you;

#  `dcmmb` aka. Docker MySQL & MongoDB Containers Backup script
To use `dcmmb` efficiently, you have to know some [Docker](https://docker.com) commands uses, and linux command `crontab`.

> This is 'main' branch which is used for development purpose. Go to [Releases](https://github.com/kylesinlynn/dcmmb/releases) for stable use.

# Content
- [`dcmmb` aka. Docker MySQL \& MongoDB Containers Backup script](#dcmmb-aka-docker-mysql--mongodb-containers-backup-script)
- [Content](#content)
- [Setup](#setup)
  - [Clone the git repository](#clone-the-git-repository)
  - [Create execute permission for user](#create-execute-permission-for-user)
  - [Modify `dcmmb` values](#modify-dcmmb-values)
  - [Run the script](#run-the-script)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

# Setup
## Clone the git repository
```bash
git clone https://github.com/kylesinlynn/dcmmb.git && cd dcmmb
```

## Create execute permission for user
```bash
sudo chmod u+x src/backup_script.sh setup.sh
```

## Modify `dcmmb` values
**In order to change time, you can change `* * * *` in [setup.sh](setup.sh)**

Open [backup_script.sh](src/backup_script.sh) which is under `src/` and modify the values accordingly.

## Run the script
> Since this script is intended for super user, you must have to specify `BACKUP_DIR` in `src/backup_script.sh` if you are not superuser. 
```bash
sudo ./setup.sh
```

# Troubleshooting
Create an issue upon your error that is associated with this project.

# Contributing
Feel free to fork and create pull requests. Your contribution will be appreciated.

# License
This project is licensed under [BSD License](LICENSE).
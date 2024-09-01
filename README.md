[Resourced from Azure Docker](https://youtu.be/HyCO6nMdxC0?si=NDLwWFyNKGs4096J)

[Resourced from Azure App Service](https://youtu.be/Jt8iqgaz1Po?si=IOtSPxSJXWJPeLBj)

[Resourced from AWS 1](https://youtu.be/1_AlV-FFxM8?si=Ujh5uufHk42UJEq1)

[Resourced from AWS 2](https://youtu.be/pJ_nCklQ65w?si=Gjite7yeH1RpQ1gb)

1. Create virtual env(For the first time project runs)
    ```
    python3 -m venv project_env
    ```

2. Run virtual env(Every time before project runs)
    ```
    source project_env/bin/activate
    ```

    * Stop virtual env
    ```
    deactivate
    ```

* Folder structure
    ```
    └── 📁test-azure-fastai
        └── 📁app
            └── __init__.py
            └── main.py
        └── 📁project_env
        └── Dockerfile
        └── README.md
        └── .gitignore
        └── .env
        └── requirements.txt
    ```

3. Add fastapi
    ```
    pip3 install "fastapi[standard]" 
    ```

4. Add dependency file
    ```
    pip3 freeze > requirements.txt
    ```

5. Run server
    ```
    fastapi dev app/main.py
    ```

    or

    ```
    fastapi run app/main.py
    ```

6. Build using `docker-compose` file

    * To build and start
    ```
    docker-compose up --build
    ```
    
    * To stop and remove
    ```
    docker compose down
    ```
    
7. Create docker image
    ```
    docker build -t project-image .
    ```

8. Run build docker image
   ```
   docker run -d --name project-container -p 80:80 project-image
   ```

9. Open on browser [http://localhost](http://localhost)

Deploying to Azure as a Container

* Get info about Docker
    ```
    docker -D info
    ```
* Initialize docker files
    ```
    docker init
    ```

1. Login to remote container registry

    ```
    docker login <Name_Of_The_Server> -u <User_Name> -p <Password>
    ```

2. Tagging the image

    ```
    docker build -t <Name_Of_The_Server>/<Container_Name(Any Name)>:<Build_Tag> .
    ```

3. Push to remote container storage

    ```
    docker push <Name_Of_The_Server>/<Container_Name(Any Name)>:<Build_Tag>
    ```

Deploying to a Remote Container Registry step by step

1. Check images available
    ```
    docker images
    ```

2. Tagging the image
    ```
    docker tag <Local_Image_ID> <Azure_UserName>/<Container_Name(Any Name)>
    ```

3. Login to remote container registry
    ```
    docker login <Name_Of_The_Server>
    ```

4. Push to remote container storage

    ```
    docker push <Name_Of_The_Server>/<Container_Name>
    ```

#### Automated process for login docker registry and push image

1. Login

    ```
    ./docker_acr_login.sh
    ```

2. Run `docker build or docker-compose-build`

    ```
    docker-compose build
    docker-compose up --build
    ```
   
3. Push

    ```
    ./docker_tag_and_push.sh
    ```
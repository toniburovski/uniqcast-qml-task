class NetworkManager {

    setJwt(jwt) {
        this.jwt = jwt;
    }

    request(obj) {
        return new Promise(function(resolve, reject) {
            const xhr = new XMLHttpRequest();
            xhr.open(obj.method || "GET", obj.url);
            xhr.setRequestHeader("Content-Type", "application/json");

            if(this.jwt) {
                xhr.setRequestHeader("Authorization", "Bearer " + this.jwt);
            }

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status && xhr.status === 200) {
                        const response = JSON.parse(xhr.response);
                        resolve(response);
                    } else {
                        const error = JSON.parse(xhr.response);
                        reject(error);
                    }
                }
            };
            xhr.send(JSON.stringify(obj.body));
        }.bind(this));
    };
}

const networkManager = new NetworkManager();

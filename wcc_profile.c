#include <stdio.h>
#include <stdbool.h>

struct AdNetwork {
    char* domain;
    char* publisher_id;
    char* relationship;
    char* cert_id;
};

struct AppInfo {
    char* name;
    char* url;
};

int main() {
    struct AdNetwork ads = {"google.com", "pub-7182145371991939", "DIRECT", "f08c47fec0942fa0"};
    struct AppInfo app = {"Whellcolor Cube Crypto (WCC)", "https://whellcolor.github.io/"};

    printf("Application: %s\n", app.name);
    printf("AdSense Line: %s, %s, %s, %s\n", ads.domain, ads.publisher_id, ads.relationship, ads.cert_id);
    
    return 0;
}

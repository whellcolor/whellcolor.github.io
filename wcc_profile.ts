interface WccConfig {
    appName: string;
    url: string;
    publisherId: string;
    adsTxtLine: string;
    ownerName: string;
}

const config: WccConfig = {
    appName: "Whellcolor Cube Crypto (WCC)",
    url: "https://whellcolor.github.io/",
    publisherId: "pub-7182145371991939",
    adsTxtLine: "google.com, pub-7182145371991939, DIRECT, f08c47fec0942fa0",
    ownerName: "Muhammad Nur Firdaus"
};

console.log(`Loading configurations for ${config.appName}...`);

FROM gcr.io/google-appengine/aspnetcore:3.1

# install System.Drawing native dependencies
RUN apt-get update \
    && apt-get install -y --allow-unauthenticated \
        libc6-dev \
        libgdiplus \
        libx11-dev \
     && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app
ENTRYPOINT ["dotnet", "bin/Release/netcoreapp3.1/BetterTrucksDeployTest4.dll"]

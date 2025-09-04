# 1. Build aşaması
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Proje dosyalarını kopyala ve restore yap
COPY *.csproj ./
RUN dotnet restore

# Geri kalan dosyaları kopyala ve publish et
COPY . ./
RUN dotnet publish -c Release -o /app

# 2. Runtime aşaması
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app ./

# ASP.NET Core uygulamasını hangi porttan çalıştıracağını belirt
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

# Uygulamayı çalıştır
ENTRYPOINT ["dotnet", "MyMvcApp.dll"]

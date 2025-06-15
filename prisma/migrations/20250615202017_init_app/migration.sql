-- CreateEnum
CREATE TYPE "GameStatus" AS ENUM ('COMPLETED', 'DROPPED', 'BACKLOG', 'PLAYING');

-- CreateEnum
CREATE TYPE "PrivacyStatus" AS ENUM ('PUBLIC', 'PRIVATE');

-- CreateTable
CREATE TABLE "app_profiles" (
    "id" TEXT NOT NULL,
    "displayName" TEXT NOT NULL,
    "privacyStatus" "PrivacyStatus" NOT NULL,

    CONSTRAINT "app_profiles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "app_games" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "releaseYear" INTEGER NOT NULL,

    CONSTRAINT "app_games_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "app_genres" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "app_genres_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "app_profile_games" (
    "profileId" TEXT NOT NULL,
    "gameId" INTEGER NOT NULL,
    "status" "GameStatus" NOT NULL,
    "comment" TEXT,
    "rating" INTEGER,

    CONSTRAINT "app_profile_games_pkey" PRIMARY KEY ("profileId","gameId")
);

-- CreateTable
CREATE TABLE "_GameToGenre" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_GameToGenre_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "app_profiles_displayName_key" ON "app_profiles"("displayName");

-- CreateIndex
CREATE UNIQUE INDEX "app_games_title_key" ON "app_games"("title");

-- CreateIndex
CREATE UNIQUE INDEX "app_genres_name_key" ON "app_genres"("name");

-- CreateIndex
CREATE INDEX "_GameToGenre_B_index" ON "_GameToGenre"("B");

-- AddForeignKey
ALTER TABLE "app_profile_games" ADD CONSTRAINT "app_profile_games_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "app_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "app_profile_games" ADD CONSTRAINT "app_profile_games_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "app_games"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGenre" ADD CONSTRAINT "_GameToGenre_A_fkey" FOREIGN KEY ("A") REFERENCES "app_games"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGenre" ADD CONSTRAINT "_GameToGenre_B_fkey" FOREIGN KEY ("B") REFERENCES "app_genres"("id") ON DELETE CASCADE ON UPDATE CASCADE;

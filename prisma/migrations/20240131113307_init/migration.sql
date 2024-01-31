-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "age" INTEGER NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Post" (
    "id" SERIAL NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "authorId" INTEGER NOT NULL,
    "favouriteId" INTEGER NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userPrefrences" (
    "userId" INTEGER NOT NULL,
    "userPrefrenceId" INTEGER NOT NULL,
    "emailNotification" BOOLEAN NOT NULL,

    CONSTRAINT "userPrefrences_pkey" PRIMARY KEY ("userPrefrenceId")
);

-- CreateIndex
CREATE UNIQUE INDEX "userPrefrences_userId_key" ON "userPrefrences"("userId");

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_favouriteId_fkey" FOREIGN KEY ("favouriteId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

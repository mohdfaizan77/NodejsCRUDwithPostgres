/*
  Warnings:

  - You are about to drop the column `favouriteId` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the `userPrefrences` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `categoryId` to the `Post` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_favouriteId_fkey";

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "favouriteId",
ADD COLUMN     "categoryId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "userPrefrences";

-- CreateTable
CREATE TABLE "category" (
    "categoryId" INTEGER NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "category_pkey" PRIMARY KEY ("categoryId")
);

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "category"("categoryId") ON DELETE RESTRICT ON UPDATE CASCADE;

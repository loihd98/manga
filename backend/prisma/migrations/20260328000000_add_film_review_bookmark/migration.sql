-- AlterTable: add filmReviewId column to bookmarks
ALTER TABLE "bookmarks" ADD COLUMN "filmReviewId" TEXT;

-- CreateIndex: unique constraint on (userId, filmReviewId)
CREATE UNIQUE INDEX "bookmarks_userId_filmReviewId_key" ON "bookmarks"("userId", "filmReviewId");

-- AddForeignKey: bookmarks.filmReviewId -> film_reviews.id
ALTER TABLE "bookmarks" ADD CONSTRAINT "bookmarks_filmReviewId_fkey" FOREIGN KEY ("filmReviewId") REFERENCES "film_reviews"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- CreateEnum
CREATE TYPE "UsersRole" AS ENUM ('ADMIN', 'SHOP_OWNER');

-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('PENDING', 'ACTIVE', 'BLOCKED');

-- CreateEnum
CREATE TYPE "AuthProvider" AS ENUM ('CREDENTIALS', 'GOOGLE');

-- CreateEnum
CREATE TYPE "District" AS ENUM ('BAGERHAT', 'BANDARBAN', 'BARGUNA', 'BARISHAL', 'BHOLA', 'BOGURA', 'BRAHMANBARIA', 'CHANDPUR', 'CHATTOGRAM', 'CHUADANGA', 'CUMILLA', 'COXS_BAZAR', 'DHAKA', 'DINAJPUR', 'FARIDPUR', 'FENI', 'GAIBANDHA', 'GAZIPUR', 'GOPALGANJ', 'HABIGANJ', 'JAMALPUR', 'JASHORE', 'JHALOKATHI', 'JHENAIDAH', 'JOYPURHAT', 'KHAGRACHARI', 'KHULNA', 'KISHOREGANJ', 'KURIGRAM', 'KUSHTIA', 'LAKSHMIPUR', 'LALMONIRHAT', 'MADARIPUR', 'MAGURA', 'MANIKGANJ', 'MEHERPUR', 'MOULVIBAZAR', 'MUNSHIGANJ', 'MYMENSINGH', 'NAOGAON', 'NARAIL', 'NARAYANGANJ', 'NATORE', 'NETROKONA', 'NILPHAMARI', 'NOAKHALI', 'NARSINGDI', 'PABNA', 'PANCHGARH', 'PATUAKHALI', 'PIROJPUR', 'RAJBARI', 'RAJSHAHI', 'RANGAMATI', 'RANGPUR', 'SATKHIRA', 'SHARIATPUR', 'SHERPUR', 'SIRAJGANJ', 'SUNAMGANJ', 'SYLHET', 'TANGAIL', 'THAKURGAON', 'CHAPAI_NABABGANJ');

-- CreateEnum
CREATE TYPE "Division" AS ENUM ('BARISHAL', 'CHATTOGRAM', 'DHAKA', 'KHULNA', 'MYMENSINGH', 'RAJSHAHI', 'RANGPUR', 'SYLHET');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "email" TEXT NOT NULL,
    "role" "UsersRole" NOT NULL DEFAULT 'SHOP_OWNER',
    "status" "UserStatus" NOT NULL DEFAULT 'ACTIVE',
    "authProvider" "AuthProvider" NOT NULL DEFAULT 'CREDENTIALS',
    "password" TEXT,
    "googleId" TEXT,
    "profilePicture" TEXT,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "imageURL" TEXT DEFAULT '',
    "imagePublicId" TEXT DEFAULT '',
    "needPasswordChange" BOOLEAN NOT NULL DEFAULT false,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "deletedAT" TIMESTAMP(3),
    "blockedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usersProfile" (
    "id" TEXT NOT NULL,
    "bio" VARCHAR(500),
    "contactNumber" VARCHAR(15) NOT NULL,
    "address" VARCHAR(250),
    "city" VARCHAR(100),
    "districts" "District",
    "division" "Division",
    "country" TEXT NOT NULL DEFAULT 'Bangladesh',
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "usersProfile_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_googleId_key" ON "users"("googleId");

-- CreateIndex
CREATE INDEX "users_role_status_idx" ON "users"("role", "status");

-- CreateIndex
CREATE INDEX "users_email_status_idx" ON "users"("email", "status");

-- CreateIndex
CREATE INDEX "users_isDeleted_idx" ON "users"("isDeleted");

-- CreateIndex
CREATE UNIQUE INDEX "usersProfile_userId_key" ON "usersProfile"("userId");

-- CreateIndex
CREATE INDEX "usersProfile_userId_contactNumber_idx" ON "usersProfile"("userId", "contactNumber");

-- AddForeignKey
ALTER TABLE "usersProfile" ADD CONSTRAINT "usersProfile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

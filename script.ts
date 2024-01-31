import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient()


// const structure = async function () {
    
//     const data = await prisma.user.create({})
//     .catch((err) => {
//         console.log(err.message)
//     })
//     .finally(async () => {
//         await prisma.$disconnect()
//     })

//    console.log(`Message`)

// }

const createUser = async function () {
    const user = await prisma.user.createMany(
        {
            data: [{
                name: "testUser1",
                email: "testuser1@gmail.com",
                age: 21
            },
            {
                name: "testUser2",
                email: "testuser2@gmail.com",
                age: 21
            },
            {
                name: "testUser3",
                email: "testuser3@gmail.com",
                age: 21
            },
            {
                name: "testUser4",
                email: "testuser4@gmail.com",
                age: 21
            }]

        }
    ).catch((err) => {
         console.log(err.message)
     })
     .finally(async () => {
         await prisma.$disconnect()
     })

    console.log(`User Created`)
}


const findAllUsers = async function () {
    
    const data = await prisma.user.findMany({})
    .catch((err) => {
        console.log(err.message)
    })
    .finally(async () => {
        await prisma.$disconnect()
    })

   console.log(`All Users : ${JSON.stringify(data)} `)

}





//-----Calling Functions------//
// findAllUsers();
// createUser();
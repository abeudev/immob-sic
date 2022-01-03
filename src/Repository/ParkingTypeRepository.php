<?php

namespace App\Repository;

use App\Entity\ParkingType;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ParkingType|null find($id, $lockMode = null, $lockVersion = null)
 * @method ParkingType|null findOneBy(array $criteria, array $orderBy = null)
 * @method ParkingType[]    findAll()
 * @method ParkingType[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ParkingTypeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ParkingType::class);
    }

    // /**
    //  * @return ParkingType[] Returns an array of ParkingType objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ParkingType
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}

<?php

namespace App\Repository;

use App\Entity\RoofType;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method RoofType|null find($id, $lockMode = null, $lockVersion = null)
 * @method RoofType|null findOneBy(array $criteria, array $orderBy = null)
 * @method RoofType[]    findAll()
 * @method RoofType[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RoofTypeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, RoofType::class);
    }

    // /**
    //  * @return RoofType[] Returns an array of RoofType objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('r.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?RoofType
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}

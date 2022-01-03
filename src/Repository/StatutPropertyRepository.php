<?php

namespace App\Repository;

use App\Entity\StatutProperty;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method StatutProperty|null find($id, $lockMode = null, $lockVersion = null)
 * @method StatutProperty|null findOneBy(array $criteria, array $orderBy = null)
 * @method StatutProperty[]    findAll()
 * @method StatutProperty[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class StatutPropertyRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, StatutProperty::class);
    }

    // /**
    //  * @return StatutProperty[] Returns an array of StatutProperty objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?StatutProperty
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}

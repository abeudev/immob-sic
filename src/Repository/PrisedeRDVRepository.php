<?php

namespace App\Repository;

use App\Entity\PrisedeRDV;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method PrisedeRDV|null find($id, $lockMode = null, $lockVersion = null)
 * @method PrisedeRDV|null findOneBy(array $criteria, array $orderBy = null)
 * @method PrisedeRDV[]    findAll()
 * @method PrisedeRDV[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PrisedeRDVRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PrisedeRDV::class);
    }

    // /**
    //  * @return PrisedeRDV[] Returns an array of PrisedeRDV objects
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
    public function findOneBySomeField($value): ?PrisedeRDV
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

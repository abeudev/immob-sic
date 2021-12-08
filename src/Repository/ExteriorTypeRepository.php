<?php

namespace App\Repository;

use App\Entity\ExteriorType;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ExteriorType|null find($id, $lockMode = null, $lockVersion = null)
 * @method ExteriorType|null findOneBy(array $criteria, array $orderBy = null)
 * @method ExteriorType[]    findAll()
 * @method ExteriorType[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ExteriorTypeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ExteriorType::class);
    }

    // /**
    //  * @return ExteriorType[] Returns an array of ExteriorType objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('e.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ExteriorType
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}

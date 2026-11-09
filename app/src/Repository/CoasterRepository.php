<?php

namespace App\Repository;

use App\Entity\Coaster;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Tools\Pagination\Paginator;
use Doctrine\Persistence\ManagerRegistry;

class CoasterRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Coaster::class);
    }

    public function findFiltered(
        string $parkId = '',
        string $categoryId = '',
        int $count = 20,
        int $page = 1,
    ): Paginator {
        $begin = ($page - 1) * $count;

        $qb = $this->createQueryBuilder('c')
            ->leftJoin('c.park', 'p')
            ->leftJoin('c.categories', 'cat')
            ->addSelect('p', 'cat')
            ->distinct()
            ->setMaxResults($count)
            ->setFirstResult($begin);

        if ($parkId !== '') {
            $qb->andWhere('p.id = :parkId')
                ->setParameter('parkId', (int) $parkId);
        }

        if ($categoryId !== '') {
            $qb->andWhere('cat.id = :categoryId')
                ->setParameter('categoryId', (int) $categoryId);
        }

        return new Paginator($qb->getQuery());
    }
}

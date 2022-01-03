<?php

declare(strict_types=1);

namespace App\Service\Admin;

use App\Entity\Structures;
use App\Service\AbstractService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;

final class StructureService extends AbstractService
{
    /**
     * @var EntityManagerInterface
     */
    private $em;

    public function __construct(
        CsrfTokenManagerInterface $tokenManager,
        RequestStack $requestStack,
        EntityManagerInterface $entityManager
    ) {
        parent::__construct($tokenManager, $requestStack);
        $this->em = $entityManager;
    }

    public function create(Structures $structures): void
    {
        $this->save($structures);
        $this->clearCache('structures_count');
        $this->addFlash('success', 'message.created');
    }

    public function update(Structures $structures): void
    {
        $this->save($structures);
        $this->addFlash('success', 'message.updated');
    }

    public function remove(Structures $structures): void
    {
        $this->em->remove($structures);
        $this->em->flush();
        $this->clearCache('structures_count');
        $this->addFlash('success', 'message.deleted');
    }

    private function save(Structures $structures): void
    {
        $this->em->persist($structures);
        $this->em->flush();
    }
}
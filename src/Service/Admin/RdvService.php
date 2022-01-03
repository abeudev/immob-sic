<?php

declare(strict_types=1);

namespace App\Service\Admin;

use App\Entity\Rdv;
use App\Service\AbstractService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;


final class RdvService extends AbstractService
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

    public function create(Rdv $rdv): void
    {
        $this->save($rdv);
        $this->clearCache('rdv_count');
        $this->addFlash('success', 'message.created');
    }

     public function update(Rdv $rdv): void
    {
        $this->save($rdv);
        $this->addFlash('success', 'message.updated');
    }

    public function remove(Rdv $rdv): void
    {
        $this->em->remove($rdv);
        $this->em->flush();
        $this->clearCache('rdv_count');
        $this->addFlash('success', 'message.deleted');
    }

    private function save(Rdv $rdv): void
    {
        $this->em->persist($rdv);
        $this->em->flush();
    }
}
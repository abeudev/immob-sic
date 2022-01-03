<?php

namespace App\Entity;

use App\Repository\VenteRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=VenteRepository::class)
 */
class Vente
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Property::class, inversedBy="ventes")
     * @ORM\JoinColumn(nullable=false)
     */
    private $bien;
    
    /**
     * @ORM\Column(type="integer")
     */
    private $PrixVente;

    /**
     * @ORM\Column(type="text")
     */
    private $Dossier;

    /**
     * @ORM\Column(type="date")
     */
    private $dateVente;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="ventes")
     * @ORM\JoinColumn(nullable=false)
     */
    private $user;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getBien(): ?Property
    {
        return $this->bien;
    }

    public function setBien(?Property $bien): self
    {
        $this->bien = $bien;

        return $this;
    }

    public function getPrixVente(): ?int
    {
        return $this->PrixVente;
    }

    public function setPrixVente(int $PrixVente): self
    {
        $this->PrixVente = $PrixVente;

        return $this;
    }
    
    public function getDossier(): ?string
    {
        return $this->Dossier;
    }

    public function setDossier(string $Dossier): self
    {
        $this->Dossier = $Dossier;

        return $this;
    }

    public function getDateVente(): ?\DateTimeInterface
    {
        return $this->dateVente;
    }

    public function setDateVente(\DateTimeInterface $dateVente): self
    {
        $this->dateVente = $dateVente;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }
}
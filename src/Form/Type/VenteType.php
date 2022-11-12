<?php

declare(strict_types=1);

namespace App\Form\Type;

use App\Entity\Vente;
use App\Entity\Property;
use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

final class VenteType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('bien', EntityType::class, [
                'class' => Property::class,
                'attr' => [
                    'autofocus' => true,
                    'class' => 'form-control',
                ],
                'choice_label' => 'slug',
                'placeholder' => 'Selectionner un bien',
                'label' => 'Bien',
            ])
            ->add('user', EntityType::class, [
                'class' => User::class,
                'attr' => [
                    'autofocus' => true,
                    'class' => 'form-control',
                ],
                'choice_label' => 'username',
                'placeholder' => 's un utilisateur',
                'label' => 'Utilisateur',
            ])
            ->add('PrixVente', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'Prix de vente',
            ])
            ->add('Dossier', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'Dossier déposé',
            ])
            ->add('dateVente', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'Date de vente',
            ]);
    }
}
<?php

namespace App\Form;

use App\Entity\Coaster;
use App\Entity\Park;
use App\Entity\Category;
use App\Repository\CategoryRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CoasterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, [
                'label' => 'Nom',
                'attr' => ['class' => 'input input-bordered w-full'],
            ])
            ->add('maxSpeed', IntegerType::class, [
                'label' => 'Vitesse maximale (km/h)',
                'required' => false,
                'attr' => ['class' => 'input input-bordered w-full'],
            ])
            ->add('length', IntegerType::class, [
                'label' => 'Longueur (m)',
                'required' => false,
                'attr' => ['class' => 'input input-bordered w-full'],
            ])
            ->add('maxHeight', IntegerType::class, [
                'label' => 'Hauteur maximale (m)',
                'required' => false,
                'attr' => ['class' => 'input input-bordered w-full'],
            ])
            ->add('operating', CheckboxType::class, [
                'label' => 'En fonctionnement',
                'required' => false,
            ])
            ->add('park', EntityType::class, [
                'class' => Park::class,
                'choice_label' => 'name',
                'label' => 'Parc',
                'placeholder' => 'Choisir un parc',
                'required' => false,
                'attr' => ['class' => 'select select-bordered w-full'],
            ])
            ->add('categories', EntityType::class, [
                'class' => Category::class,
                'choice_label' => 'name',
                'label' => 'Catégories',
                'multiple' => true,
                'expanded' => true,
                'query_builder' => function (CategoryRepository $repository) {
                    return $repository->createQueryBuilder('c')
                        ->orderBy('c.name', 'ASC');
                },
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Coaster::class,
        ]);
    }
}

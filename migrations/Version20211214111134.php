<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211214111134 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE type_property (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE property ADD type_property_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE property ADD CONSTRAINT FK_8BF21CDE2D3B6045 FOREIGN KEY (statut_property_id) REFERENCES statut_property (id)');
        $this->addSql('ALTER TABLE property ADD CONSTRAINT FK_8BF21CDE1F8BC47D FOREIGN KEY (type_property_id) REFERENCES type_property (id)');
        $this->addSql('CREATE INDEX IDX_8BF21CDE2D3B6045 ON property (statut_property_id)');
        $this->addSql('CREATE INDEX IDX_8BF21CDE1F8BC47D ON property (type_property_id)');
        $this->addSql('ALTER TABLE users ADD CONSTRAINT FK_1483A5E9D1F6E7C3 FOREIGN KEY (agence_id_id) REFERENCES agences (id)');
        $this->addSql('CREATE INDEX IDX_1483A5E9D1F6E7C3 ON users (agence_id_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE property DROP FOREIGN KEY FK_8BF21CDE1F8BC47D');
        $this->addSql('DROP TABLE type_property');
        $this->addSql('ALTER TABLE property DROP FOREIGN KEY FK_8BF21CDE2D3B6045');
        $this->addSql('DROP INDEX IDX_8BF21CDE2D3B6045 ON property');
        $this->addSql('DROP INDEX IDX_8BF21CDE1F8BC47D ON property');
        $this->addSql('ALTER TABLE property DROP type_property_id');
        $this->addSql('ALTER TABLE users DROP FOREIGN KEY FK_1483A5E9D1F6E7C3');
        $this->addSql('DROP INDEX IDX_1483A5E9D1F6E7C3 ON users');
    }
}

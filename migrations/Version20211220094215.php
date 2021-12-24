<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211220094215 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE prisede_rdv ADD contact_visiteur VARCHAR(255) DEFAULT NULL, ADD nom VARCHAR(255) DEFAULT NULL, ADD prenoms VARCHAR(255) DEFAULT NULL, ADD email VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE property DROP FOREIGN KEY FK_8BF21CDE1F8BC47D');
        $this->addSql('DROP INDEX IDX_8BF21CDE1F8BC47D ON property');
        $this->addSql('ALTER TABLE property DROP type_property_id, DROP description');
        $this->addSql('ALTER TABLE users ADD is_verified TINYINT(1) NOT NULL');
        $this->addSql('ALTER TABLE users ADD CONSTRAINT FK_1483A5E9D1F6E7C3 FOREIGN KEY (agence_id_id) REFERENCES agences (id)');
        $this->addSql('CREATE INDEX IDX_1483A5E9D1F6E7C3 ON users (agence_id_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE prisede_rdv DROP contact_visiteur, DROP nom, DROP prenoms, DROP email');
        $this->addSql('ALTER TABLE property ADD type_property_id INT DEFAULT NULL, ADD description VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE property ADD CONSTRAINT FK_8BF21CDE1F8BC47D FOREIGN KEY (type_property_id) REFERENCES type_property (id)');
        $this->addSql('CREATE INDEX IDX_8BF21CDE1F8BC47D ON property (type_property_id)');
        $this->addSql('ALTER TABLE users DROP FOREIGN KEY FK_1483A5E9D1F6E7C3');
        $this->addSql('DROP INDEX IDX_1483A5E9D1F6E7C3 ON users');
        $this->addSql('ALTER TABLE users DROP is_verified');
    }
}
